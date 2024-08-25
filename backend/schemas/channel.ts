import mongoose, { Document, Schema, Types } from "mongoose";
import { IUser } from "./user";
import { IChannelChat } from "./channel_chat";

enum channelType{
    text = "text",
    voice = "voice"
}

export interface IChannel extends Document {
    title: string
    description: string
    users: IUser[]
    channelType: channelType
    channelChat?: IChannelChat
}

const channelSchema = new Schema<IChannel>(

);

export const channelModel = mongoose.model<IChannel>("channels", channelSchema);