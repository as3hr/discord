import mongoose, { Document, Schema } from "mongoose";
import { IChannel } from "./channel";
import { IUser } from "./user";

export interface IServer extends Document {
    title: string,
    image: string,
    description: string,
    members: IUser[],
    channels: IChannel[],
}

const serverSchema = new Schema<IServer>({
    title: {
        type: String,
        cast: "Invalid title type",   
    },
    image: {
        type: String,
        cast: "Invalid image type",   
    },
    description: {
        type: String,
        cast: "Invalid description type",   
    },
    members: [{
        type: Schema.Types.ObjectId,
        ref: "users",
        cast: "Invalid member type",   
    }],
    channels: [{
        type: Schema.Types.ObjectId,
        ref: "channels",
        cast: "Invalid channel type",   
    }],
});

export const serverModel = mongoose.model<IServer>("servers", serverSchema);