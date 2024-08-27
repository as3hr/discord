import mongoose, { Document, Schema } from "mongoose";
import { IUser } from "./user";

export interface IMessage extends Document {
    text: string,
    user: IUser,
}

const messageSchema = new Schema<IMessage>({
    text: {
        type: String,
        cast: "Invalid text type"
    },
    user: {
        type: Schema.Types.ObjectId,
        ref: 'users',
        cast: "Invalid user type"
    },
});

export const messageModel = mongoose.model<IMessage>("messages", messageSchema);