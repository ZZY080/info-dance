export type payloadType = {
  email: string;
  password: string;
};
export type actionType = {
  type: string;
  payload: payloadType;
};
export type stateType = { email: string; password: string };
