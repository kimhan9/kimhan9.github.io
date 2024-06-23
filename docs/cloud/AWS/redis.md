# Redis

- Connect redis: `redis-cli -h <redis-url>.apse1.cache.amazonaws.com`
- Default redis port: `6379`
- Commands:
```
# Check how many connected clients
info clients

# Set, get, delete, check key
SET name kyle
GET name
SET age 26
GET age
DEL age
EXISTS name

# Get all key
KEY *

# Clear entire cache
flushall

# Check key time to live
ttl name

# Set key name to have TTL 10s
expire name 10
setex name 10 kyle

# Set array
lpush friends john # Add a array
lrange friends 0-1 # Get array
lpush friends sally
rpush friends mike
lpop friends # take out first item
rpop friends # take out the last item

# Sets
SADD hobbies "weight lifting"
SMEMBERS hobbies
SREM hobbies

# Hash
HSET person name kyle
HGET person name
HGETALL person
HGET person age 26
HDEL person age
HEXISTS person name
HEXISTS person age
```