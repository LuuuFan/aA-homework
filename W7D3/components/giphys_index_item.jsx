import React from 'react';

const GiphysIndexItem = ({giphy}) => (
  <li>
    <img src={giphy.images.downsized_medium.url} />
  </li>
);

export default GiphysIndexItem;
