import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { StatusBar } from "expo-status-bar";
import { useEffect } from "react";
import { StyleSheet, Text, View, Image, ActivityIndicator } from "react-native";
import HomeScreen from "./screen/Home/Home";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import MyScreen from "./screen/My/My";
import Ionicons from "react-native-vector-icons/Ionicons";
import HomeStackScreen from "./screen/Home/HomeStack";
import MyStackScreen from "./screen/My/MyStack";

const Tab = createBottomTabNavigator();

export default function App() {
  useEffect(() => {}, []);
  return (
    <NavigationContainer>
      <Tab.Navigator screenOptions={{ headerShown: false }}>
        <Tab.Screen name="HomeStack" component={HomeStackScreen} />
        <Tab.Screen name="MyStack" component={MyStackScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#ffffff",
    // alignItems: "center",
    // justifyContent: "center",
  },
  img: {
    width: "100%",
    height: "10%",
    borderRadius: 100,
    objectFit: "cover",
    marginTop: 10,
  },
});
