Site: finally
Title: Find the sum of all the multiples of 3 or 5 below 1000
Subtitle: 
Date: 2016-05-01 18:57:43+05:30
Slug: euler-001
Tags: euler,swift,tsc,python
Type: Post
Excerpt: Solution to Project Euler 001 problem
---
### Python


```
# Longer version could be if i % 3 == 0 or i % 5 == 0, which will return 1
# Negating i % 3 or i % 5 produces the same result

n = 0
for i in range(1000):  
  if not i % 3 or not i % 5:    
    n = n + i
print n
# 233168
```

### Typescript

```
// execute with
// tsc soln.ts && node soln.js


var sum = 0;
for (var i = 0; i <= 1000; i++){
    if (i % 3 == 0 || i % 5 == 0){
        sum = sum + i;   
    }
}
console.log(sum);
// 233168
```

### Swift

```
// execute with
// swift soln.swift
//
// compile with
// swiftc soln.swift

var sum = 0
for index in 1..<1000{
  if (index % 3 == 0) || (index % 5 == 0) {    
    sum = sum + index
  }
}
print(sum)
// 233168
```

[Git Repository](https://github.com/jjude/euler) / [All Euler Solutions](http://tech.jjude.com/euler)

 Got comments? [Tweet](http://twitter.com/jjude) it, or comment below.
