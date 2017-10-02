import React from 'react';
import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';

const App = (props) => {
  return (
    <div className="messaging-wrapper">
      <div className="logo-container">
        <img className="messaging-logo fa fa-star" src="" />
      </div>
      <ChannelList />
      <MessageList selectedChannel={props.match.params.channel} />
    </div>
  );
};

export default App;
