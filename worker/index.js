const keys = require('./keys');
const redis = require('redis');

const redisClient = redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    retry_strategy: () => 1000
});
const sub = redisClient.duplicate();

function fib(index) {
    if (index < 2) return 1;
    return fib(index - 1) + fib(index - 2);
}

sub.on('message', (channel, message) => {
    console.debug('New index (' + parseInt(message) + ') was published');
    const result = fib(parseInt(message));
    redisClient.hset('values', message, result);
    console.debug('Value for (' + parseInt(message) + ') was calculated: ' + result);
});
sub.subscribe('insert');
