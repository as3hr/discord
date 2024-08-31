import mongoose from "mongoose";

export const configureDatabase = function () {
  mongoose
    .connect(process.env.DB_URL!)
    .then((_) => {
      console.log("DataBase connected!");
    })
    .catch((err) => {
      console.log(err);
    });
};