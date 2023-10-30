# RSSI Positioning

I am collecting the takeaways from the work of others here. The purpose of my efforts is to gain an overview so that I can set my goals more realistically. I want to learn from the experiences of others and build upon them in my work.

## An improved BLE Indoor Localization with Kalman-Based Fusion: An Experimental Study
- [Direct Source Link](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=11&ved=2ahUKEwiVub-AnKfoAhUJyKYKHdDsA5QQFjAKegQIBhAB&url=https%3A%2F%2Fwww.mdpi.com%2F1424-8220%2F17%2F5%2F951%2Fpdf&usg=AOvVaw0Hb0Ivd8yvVJdhzGGTpgP3)
- [Local Link](./assets/An_improved_BLE_Indoor_Localization_with_Kalman-Based_Fusion_An_Experimental_Study.pdf)

### Choices for Communication Technology Standards
Wifi, Bluetooth, and BLE are the most common.

| Communication Standard | Signal Rate | Normal Range | Transmission Power |
|------------------------|-------------|--------------|--------------------|
| WiFi                   | 54 mbps     | 100m         | 20dBm              |
| Classic Bluetooth      | 1mbps       | 10m          | 10dBm              |
| BLE                    | 720kbps     | 10m          | 1dBm               |

- BLE is not heavily influenced by the environment (e.g., furniture in a room). BLE has a higher sampling rate, making it easier to detect outliers.
- Kalman filtering for refining RSSI measurement data.
- Dead reckoning with sensor data (accelerometer, compass) can become complex quickly.
- The WiFi fingerprinting method (hashing all position data in a database) is very time-consuming. RSSI signals have significant variance, making it complex, especially for large buildings.
- WiFi is intrinsically less accurate than BLE but has a longer range.
--> Hybrid methods can mitigate the shortcomings of individual techniques.

### RSSI Problem 1: Multipath and Fading
Radio signals are reflected by objects in the environment, creating multiple signal paths. Interference distorts RSSI measurement data, and the signal fades.

The log-distance path loss model is a known way to convert RSSI values into distance. To "calibrate" the BLE device for the room, RSSI is compared with distance at fixed intervals under the same conditions. This yields an exponent for the log-distance path loss model, describing the room's purity.

### RSSI Problem 2: RSSI Filtering
Median and mean:
Many measurements for higher accuracy, but data quickly becomes outdated.

Kalman Filtering:
Flattens the data curve, eliminating the influence of outliers. Parameters must be experimentally determined. Below, Mean, Median, and Kalman Filters are compared, with the Kalman filter providing the best data smoothing.
![comparative-analysis-of-the-adopted-filters](./assets/comparative-analysis-of-the-adopted-filters.png)

### RSSI Problem 3: Tri- or Multilateration
Trilateration draws a circle around one of the at least 3 nodes. The system is overdetermined (3 equations, 2 unknowns) --> no unique solution.
![least-squares.png](./assets/least-squares.png)

Due to the path loss model, measured distances of over 4m are ignored in their algorithm.

The accepted distance is incremented each iteration in search of at least three distances < 3m. Above 10m the thread stops. Otherwise, position is trilaterated, and the average filter applied.

Antenna orientation apparently affects signal strength, reducing accuracy. Water absorbs signals, and people are also obstacles.

The next part of the report deals with calculating the position using "Dead reckoning." The idea is to measure the user's steps (accelerometer) from a known starting point and process them with orientation (magnetic field). I do not plan to develop a product for people, so I ignore this part. Dead reckoning accumulates measurement errors, which is why other methods are recommended for long-term applications.

Bluefruit LE Friend (BLE 4.0) beacons were used here. A Samsung Galaxy TAB processed the data stream and saved it in text files.

## Cloud-Based Indoor Positioning - ESP32 Client
- [Direct Link:](http://rvs.unibe.ch/research/pub_files/Cloud-Based_Indoor_Positioning-ESP32_Client.pdf)
- [Local Link:](./assets/Cloud-Based_Indoor_Positioning-ESP32_Client.pdf)
Localization is done with WiFi and pedestrian dead reckoning. A central server processes the data. By offloading heavy computations to a server, multiple mobile devices can be tracked. Clients only need to collect data.

A dynamic selection of regression models improves ranging accuracy. Static alternatives do not work as well.

### Theoretical Background
A suitable data communication protocol and data format are required.
#### Protocol
TCP is better than UDP for text. WebSocket is great. HTTP headers are upgraded to WebSocket.

#### Data Format
Few auxiliary characters result in fewer bits and better performance. JSON is good, widely known, and human-readable.

Regression models:
- Linear
- Exponential
- Quadratic polynomial
- Cubic polynomial

![Regression models](./assets/regression_models.png)

Received signals from nodes include their position, signal strength, and distance. These can be used in various regression models. In this report, a room model is created to apply an appropriate regression cocktail. It seems to be more accurate than static regression for all scenarios.

A Hampel filter removes outliers from the last measurements and then takes the average of the remaining data. A high sampling rate is needed.

The error in Bluetooth systems is apparently about 3.5m.

### Data Persistence
Data persistence is a challenge for web servers. Asynchronous function requests save CPU usage. Load balancing is important to distribute CPU load.

The server stores:
- Experiment Data
- System Data:
    - GPS data from the client
    - Access networks and their positions
    - Parameters for regression models
    - Training data for regression
    - Signal strength from all training devices
- User Data: Raw data from the client

ESP32 sends RSSI data, accelerometer, gyroscope, and magnetometer readings. <b>The IEEE 802.11 standard only allows sampling rates of ~0.5Hz because RSSI data is exclusively attached to specific beacon frames, which are sent at defined intervals.</b>

### Server Configuration
OpenStack was used as a virtualization platform.
- Ubuntu 16.4 was used as the operating system.
- Python 3.6 was the programming language used for the implementation.
No code was directly written in any other language.
- SQLite 3.11.0 was used for persistent data storage.
- Nginx 1.10.3 was used as a load balancer.

### ESP32 Microcontroller as Client
ESP32 with separate WiFi and sensor modules was used. The entire project was programmed with the Arduino IDE. Espressif Systems and the Arduino development environment provide good APIs.

- WiFi: WiFi for ESP32
- WebSocket: WebSocket client for Arduino, with fast data
