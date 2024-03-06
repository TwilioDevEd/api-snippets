exports.handler = (context, event, callback) => {
  const joke = 'How many apples grow on a tree? They all do!';
  return callback(null, joke);
};
