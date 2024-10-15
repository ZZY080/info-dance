import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { View } from "react-native";
import DetailScreen from "../Detail/Detail";
import MyScreen from "./My";
const MyStack = createNativeStackNavigator();
const MyStackScreen = () => {
  return (
    <MyStack.Navigator>
      <MyStack.Screen name="My" component={MyScreen} />
      <MyStack.Screen name="Detail" component={DetailScreen} />
    </MyStack.Navigator>
  );
};
export default MyStackScreen;
