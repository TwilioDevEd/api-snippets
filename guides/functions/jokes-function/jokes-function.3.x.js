exports.handler = function(context, event, callback) {
    let knockKnock = {'id':1,'text':'Knock, knock','favorited':37};
    let chicken = {'id':2,'text':'Why did the chicken cross the road?','favorited':12};
    let jokes = [knockKnock, chicken];
    callback(null, jokes);
};