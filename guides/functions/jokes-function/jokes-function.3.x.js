exports.handler = function(context, event, callback) {
  const knockKnock = { id: 1, text: 'Knock, knock', favorited: 37 };
  const chicken = {
    id: 2,
    text: 'Why did the chicken cross the road?',
    favorited: 12,
  };
  const jokes = [knockKnock, chicken];
  callback(null, jokes);
};
