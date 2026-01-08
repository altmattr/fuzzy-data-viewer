# Fuzzy Data Map Viewer for BlueOS

Data from drone sensors can be _noisy_.  If you want to make decisions live based on noisy data, you need a good interface to help pyou make sense of it.  This extension provides an interface specifically designed for noisy data which is mixed in with (also noisy) GPS data.  I.e. GPS co-ordintes are bieing logged alon with _some other data stream_.  The second data stream is not attached to the GPS data (i.e. comes in a different time stamps), but it never too far from an associated GPS data point.  There may be a variable number of readings taken between GPS data points (including zero) and this extension takes care of all of that for you.

If you have worked with drones, you know this is precisely the type of data you are working with.  When it is not location-sensitive there are other ways to visualise it, but if you want to see this noisy data on a graph, summarised live and presented in a way that supports on the spot decision making - this is the extension for you.

## Instructions

### Creating Your Extension
Start by creating your extension using this template as a base. Simply navigate to the upper menu and select "Use this template."

### Building the Extension

To build your BlueOS extension, follow the steps below:

#### For Direct Raspberry Use

1. Navigate to your extension's source code.

2. Execute the following command to build your extension:

   ```shell
   docker build .
    ```

#### For build it from your computer or CI, use docker buildx:
1. Execute the following command to build your extension:

   ```shell
   docker buildx build --platform linux/arm/v7 . -t my_docker_user/my_blueos_extension:latest --output type=registry
    ```


### Running your extension:

To run your BlueOS extension, follow these steps:

#### Within BlueOS
1. Navigate to Extensions > Installed and click the Add button to create and launch your extension from BlueOS.

#### Manual use

2. For Raspberry Pi users, you can also manually run your extension by executing the following command:
   ```shell
   docker run --detach --publish 9999:80 my_docker_user/my_blueos_extension:latest
    ```
