import mongoose, { Document, Schema, Types } from "mongoose";
import { IUser } from "./user";

export interface IChannelChat extends Document {
    title: string,
    description: string,
    users: IUser[],
    channelId: Schema.Types.ObjectId
}

const channelChatSchema = new Schema<IChannelChat>(

);

export const channelChatModel = mongoose.model<IChannelChat>("channelChats", channelChatSchema);