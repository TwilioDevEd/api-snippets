exports.handler = function(context, event, callback) {
	let joke = "How many apples grow on a tree? They all do!";
	callback(null, joke);
};