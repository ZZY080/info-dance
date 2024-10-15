import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { View } from "react-native";
import HomeScreen from "./Home";
import DetailScreen from "../Detail/Detail";
const HomeStack = createNativeStackNavigator();
const HomeStackScreen = () => {
  return (
    <HomeStack.Navigator>
      <HomeStack.Screen name="Home" component={HomeScreen} />
      <HomeStack.Screen name="Detail" component={DetailScreen} />
    </HomeStack.Navigator>
  );
};
export default HomeStackScreen;
