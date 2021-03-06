export default function messagesReducer(state = null, action) {
  switch (action.type) {
    case 'FETCH_MESSAGES':
      const messages = action.payload;
      // const channel = action.payload.channel;
      return messages;
    case 'MESSAGE_POSTED':
      if (state.map(message => message.id).includes(action.payload.id)) {
        return state;
      } else {
        const copiedState = state.slice(0);
        copiedState.push(action.payload);
        return copiedState;
      }
      return copiedState;
    case 'CHANNEL_SELECTED':
      return []; // Channel has changed. Clearing view.
    default:
      return state;
  }
};