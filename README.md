# **LiquidGalaxy Stadium Controller**
Flutter application that allows users to navigate to different football stadiums using Liquid Galaxy. 
This app sends location data and KML files to a Liquid Galaxy instance via API requests.

## **Features**
- Select from four football stadiums:
    - Metropolitano
    - Camp Nou
    - Santiago Bernabéu
    - San Mamés
- Display team logos.
- Clean Liquid Galaxy visualization.
- Reload the Liquid Galaxy instance.
- Toggle logo display in Liquid Galaxy.

## **Demo**
![Screenshot_1741630369](https://github.com/user-attachments/assets/e3d8a9cc-139c-4fd4-8193-d686a3ac1656)


## **Setup and Installation**

### **Prerequisites**
- Flutter installed ([Installation Guide](https://docs.flutter.dev/get-started/install)).
- Liquid Galaxy set up and running.
- Liquid Galaxy Server ([Lg-server](https://github.com/LiquidGalaxyLAB/lg-server?tab=readme-ov-file#endpoints))
- API endpoint for Liquid Galaxy communication.

### **Clone the repository**
```bash
git clone https://github.com/your-username/liquidgalaxy-stadium-controller.git
cd liquidgalaxy-stadium-controller
```

### **Install dependencies**
```bash
flutter pub get
```

### **Run the application**
```bash
flutter run
```

## **Usage**
1. Open the application.
2. Select a stadium by clicking its team logo.
3. The app will send the necessary API requests to Liquid Galaxy.
4. Use the **Clean** button to clear the view.
5. Use the **Reload** button to restart Liquid Galaxy.
6. Access settings to toggle team logos on Liquid Galaxy.

### **Available API requests**
- **FlyTo a stadium**: `POST /lg-connection/flyto`
- **Send KML file**: `POST /lg-connection/stadium`
- **Clean visualization**: `POST /lg-connection/clean-visualization`
- **Clean logos**: `POST /lg-connection/clean-logos`
- **Show logo**: `POST /lg-connection/show-logo`
- **Reload Liquid Galaxy**: `POST /lg-connection/relaunch-lg`
