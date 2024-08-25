import bcrypt from "bcrypt";
import mongoose, { Document, Schema, Types } from "mongoose";

export interface IUser extends Document {
  firstName: string;
  lastName: string;
  gender: string;
  image: string;
  friends: IUser[],
  password?: string;
  email: string;
  archived: boolean;
  fcmTokens?: Types.Array<string>;
  comparePassword(password: string): Promise<boolean>;
}

const userSchema = new Schema<IUser>(
  {
    password: {
      type: String,
      cast: "password datatype is incorrect",
      select: false,
    },
    gender: {
      type: String,
      cast: "gender datatype is incorrect",
    },
    friends: [{
      type: Schema.Types.ObjectId,
      ref: 'users',
      cast: 'Invalid friend Id'
    }],
    email: {
      type: String,
      unique: true,
      lowercase: true,
      trim: true,
      partialFilterExpression: { email: { $type: "string" } },
      match: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
      cast: "email datatype is incorrect",
    },
    fcmTokens: [
      {
        type: String,
        cast: "fcmTokens datatype is incorrect",
        select: false,
      },
    ],
    archived: {
      type: Boolean,
      cast: "invalid archived type",
      default: false,
    },
    firstName: {
      type: String,
      cast: "invalid firstName type",
    },
    lastName: {
      type: String,
      cast: "invalid lastName type",
    },
    image: {
      type: String,
      cast: "invalid image type",
    },
    },
  {
    timestamps: true,
    versionKey: false,
    toJSON: { virtuals: true },
  }
);

userSchema.pre("save", function (next) {
  bcrypt.hash(
    this.password!,
    parseInt(process.env.SALT_WORK_FACTOR!),
    (err: any, hashedPass: string) => {
      if (err) {
        throw err;
      }
      this.password = hashedPass;
      next();
    }
  );
});

userSchema
  .virtual("fullName")
  .get(function () {
    let fullName = "";

    if (this.firstName && this.lastName) {
      fullName = `${this.firstName} ${this.lastName}`;
    } else if (this.firstName) {
      fullName = this.firstName;
    } else if (this.lastName) {
      fullName = this.lastName;
    }

    return fullName.trim();
  })
  .set(function (v) {
    const names = v.split(" ");

    if (names.length === 2) {
      this.set({ firstName: names[0], lastName: names[1] });
    } else if (names.length === 1) {
      if (this.firstName) {
        this.set({ firstName: names[0], lastName: "" });
      } else {
        this.set({ lastName: names[0], firstName: "" });
      }
    }
  });

userSchema.method<IUser>(
  "comparePassword",
  async function comparePassword(password: string) {
    const user: IUser | null = await userModel
      .findOne({ _id: this._id })
      .select("+password");
      if(user){
          return bcrypt.compare(password, user.password!);
      }else{
        return false;
      }
  }
);

export const userModel = mongoose.model<IUser>("users", userSchema);