# import the necessary packages
import time
import cv2
import os

def super_resolution(input_img, model_path=""):
    model_path = os.path.dirname(os.path.realpath(__file__))
    model_path = os.path.join(model_path, "models\\EDSR_x4.pb")
    # extract the model name and model scale from the file path
    # model_name = model_path.split("/")[-1].split("_")[0].lower()
    model_name = "edsr"
    # model_scale = model_path.split("_x")[-1]
    # model_scale = int(model_scale[:model_scale.find(".")])
    model_scale = 4

    # initialize OpenCV's super resolution DNN object, load the super
    # resolution model from disk, and set the model name and scale
    print("[INFO] loading super resolution model: {}".format(model_path))
    print("[INFO] model name: {}".format(model_name))
    print("[INFO] model scale: {}".format(model_scale))

    sr = cv2.dnn_superres.DnnSuperResImpl_create()
    sr.readModel(model_path)
    sr.setModel(model_name, model_scale)

    # load the input image from disk and display its spatial dimensions
    # image = cv2.imread(input_img_path)
    print("[INFO] w: {}, h: {}".format(input_img.shape[1], input_img.shape[0]))

    # use the super resolution model to upscale the image, timing how
    # long it takes
    start = time.time()
    upscaled_img = sr.upsample(input_img)
    end = time.time()

    upscaled_img = cv2.cvtColor(upscaled_img, cv2.COLOR_BGR2RGB)

    print("[INFO] super resolution took {:.6f} seconds".format(end - start))

    # show the spatial dimensions of the super resolution image
    print("[INFO] w: {}, h: {}".format(upscaled_img.shape[1], upscaled_img.shape[0]))

    return upscaled_img

if __name__ == "__main__":
    # super_resolution("examples/BSDS100/253027.png", "models/LapSRN_x8.pb")
    super_resolution("examples/BSDS100/253027.png", "models/EDSR_x4.pb")