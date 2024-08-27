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
    channelType: channelType
    channelChat: IChannelChat
}

const channelSchema = new Schema<IChannel>({
    title: { 
        type: String, 
        cast: "Invalid title type" 
    },
    description: { 
        type: String, 
        cast: "Invalid description type" 
    },
    channelType: { 
        type: String, 
        enum: Object.values(channelType), 
        default: channelType.text, 
        cast: "Invalid chatType" 
    },
    channelChat: { 
        type: Schema.Types.ObjectId, 
        ref: "channelChats", 
        cast: "Invalid channel Chat type" 
    }
});

export const channelModel = mongoose.model<IChannel>("channels", channelSchema);