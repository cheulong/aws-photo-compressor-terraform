import { blobToURL, urlToBlob, fromBlob, fromURL } from "image-resize-compress";

export const handler = async (event) => {
  console.log("Lambda invoke", event);
  const { body } = event;
  console.log({ body });

  // const quality = 80; // For webp and jpeg formats
  // const width = "auto"; // Original width
  // const height = "auto"; // Original height
  // const format = "jpeg "; // Output format
  // const resizedBlob = await fromBlob(blobFile, quality, width, height, format);
  // const url = await blobToURL(resizedBlob);
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: "Hello World!!!!!",
    }),
  };
};
