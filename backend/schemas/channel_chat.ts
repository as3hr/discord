import mongoose, { Document, Schema } from "mongoose";
import { IUser } from "./user";
import { IMessage } from "./message";

export interface IChannelChat extends Document {
    title: string,
    description: string,
    members: IUser[],
    messages: IMessage[],
    channelId: Schema.Types.ObjectId
}

const channelChatSchema = new Schema<IChannelChat>({
    title: { type: String, cast: "Invalid title type" },
    description: { type: String, cast: "Invalid description type" },
    members: [{ type: Schema.Types.ObjectId, ref: 'users', cast: "Invalid member type" }],
    messages: [{ type: Schema.Types.ObjectId, ref: 'messages', cast: "Invalid message type" }],
    channelId: { type: Schema.Types.ObjectId, ref: 'channels', cast: "Invalid channelId type" },
});

export const channelChatModel = mongoose.model<IChannelChat>("channelChats", channelChatSchema);