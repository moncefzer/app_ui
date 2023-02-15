// How to use :
//  - create your assets folder and put your assets in image / icons folder
//  - paste the script in the assets folder
//  - execute the script  =>  node assets/create_resources_script.js
//  - move the created file (app_resources.dart) inside your lib folder
//  - your ready to work now :)
const fsPromises = require("fs").promises;
const fs = require("fs");
const path = require("path");

const fileName = "app_resources.dart";

createImageResources = async () => {
  await fsPromises.writeFile(
    path.join(__dirname, fileName),
    `const imagePath = "assets/images";
    class ImageResources {
      `
  );

  const data = await fsPromises.readdir(path.join(__dirname, "images"));

  for (let i = 0; i < data.length; i++) {
    const assetPath = path.basename(path.join(__dirname, data[i]));
    const assetName = path
      .basename(path.join(__dirname, data[i]))
      .split(".")[0];
    await fsPromises.appendFile(
      path.join(__dirname, fileName),
      `  static const String ${assetName} ='\$imagePath/${assetPath}';\n`
    );
  }

  await fsPromises.appendFile(path.join(__dirname, fileName), `}\n`);
};

createIconResources = async () => {
  await fsPromises.appendFile(
    path.join(__dirname, fileName),
    `const iconPath = "assets/icons";
    class IconResources {
      `
  );
  const data = await fsPromises.readdir(path.join(__dirname, "icons"));

  for (let i = 0; i < data.length; i++) {
    const assetPath = path.basename(path.join(__dirname, data[i]));
    const assetName = path
      .basename(path.join(__dirname, data[i]))
      .split(".")[0];
    await fsPromises.appendFile(
      path.join(__dirname, fileName),
      `  static const String ${assetName} ='\$iconPath/${assetPath}';\n`
    );
  }

  await fsPromises.appendFile(path.join(__dirname, fileName), `}\n\n`);
};

createVideoResources = async () => {
  await fsPromises.appendFile(
    path.join(__dirname, fileName),
    `const videoPath = "assets/videos";
    class VideoResources {
      `
  );
  const data = await fsPromises.readdir(path.join(__dirname, "videos"));

  for (let i = 0; i < data.length; i++) {
    const assetPath = path.basename(path.join(__dirname, data[i]));
    const assetName = path
      .basename(path.join(__dirname, data[i]))
      .split(".")[0];
    await fsPromises.appendFile(
      path.join(__dirname, fileName),
      `  static const String ${assetName} ='\$videoPath/${assetPath}';\n`
    );
  }

  await fsPromises.appendFile(path.join(__dirname, fileName), `}\n\n`);
};

createResources = async () => {
  if (fs.existsSync(path.join(__dirname, "images"))) {
    await createImageResources();
  }
  if (fs.existsSync(path.join(__dirname, "icons"))) {
    await createIconResources();
  }
  if (fs.existsSync(path.join(__dirname, "videos"))) {
    await createVideoResources();
  }
};

createResources();
