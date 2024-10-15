import { View, Text, Button } from "react-native";

const HomeScreen = ({ navigation }) => {
  return (
    <View>
      <Text>Home</Text>
      <Button
        title="Go to Home"
        onPress={() => navigation.navigate("Detail")}
      />
    </View>
  );
};

export default HomeScreen;
