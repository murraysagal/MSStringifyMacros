# MSStringifyMacros

MSStringifyMacros provides a convenient alternative to the normally tedious and potentially error-prone standard approach to coding for NSUserDefaults and NSCoding.

---
## Benefits

Here's an example for NSUserDefaults. Normally, when coding for NSUserDefaults you would follow an approach like this where you would create constants for the keys and then set and get the defaults.

```
#!objective-c

// constants for keys...
static NSString const * kKeyForFoo = @"keyForFoo";
static NSString const * kKeyForBar = @"keyForBar";

// setting defaults...
[[NSUserDefaults standardUserDefaults] setObject:self.foo forKey:kKeyForFoo];
[[NSUserDefaults standardUserDefaults] setObject:self.bar forKey:kKeyForBar];

// getting defaults...
self.foo = [[NSUserDefaults standardUserDefaults] objectForKey:kKeyForFoo];
self.bar = [[NSUserDefaults standardUserDefaults] objectForKey:kKeyForBar];
```

By leveraging a preprocessor feature called stringification (explained in a later section) the tedious code above can be replaced with this...

```
#!objective-c

// setting defaults...
setDefaultForObject(self.foo);
setDefaultForObject(self.bar);

// getting defaults...
defaultForObject(self.foo);
defaultForObject(self.bar);
```

As you can see, there is a lot less code, it's a lot simpler, and less error-prone.


---
## Installation

You can install MSStringifyMacros in almost any Mac OS X or iOS project. I'm not certain if there were ever any versions of Xcode where the preprocessor didn't support stringification to an NSString (see the Stringification section below). If you know, please let me know.


### Cocoapods

1. Add a pod entry for MSStringifyMacros to your Podfile: `pod 'MSStringifyMacros'`. If you want to add only specific macros you can use `pod 'MSStringifyMacros/UserDefaults'` or `pod 'MSStringifyMacros/Archiving'`. Refer to the podspec for the current submodules.
2. Install the pod(s) by running `pod install`.
3. Where you need it `#import "MSStringifyMacros_Archiving.h"` or `#import "MSStringifyMacros_UserDefaults.h"`.

### Source Files

Alternatively you can directly add the required `MSStringifyMacros*.h` source files to your project.


---
## NSUserDefaults

The macros support all the common NSUserDefaults methods for conveniently setting and getting defaults. The parameter you pass can be a property, an instance variable, or a local variable. Once you set a default you must use the same property, instance variable, or an identically named local variable for getting the default. 

```
// BOOL...
setDefaultForBool(BOOL);
defaultForBool(BOOL);

// double...
setDefaultForDouble(double);
defaultForDouble(double);

// float...
setDefaultForFloat(float);
defaultForFloat(float);

// integer...
setDefaultForInteger(yourInteger);
defaultForInteger(yourInteger);

// object...
setDefaultForObject(yourObject);
defaultForObject(yourObject);
removeDefaultForObject(yourObject);

// array...
defaultForArray(yourArray);

// data...
defaultForData(yourData);

// dictionary...
defaultForDictionary(yourDictionary);

// string...
defaultForString(yourString);

// array of strings...
defaultForStringArray(yourArrayOfStrings);

// url...
defaultForURL(yourUrl);
```


---
## NSUserDefaults Extras

By default, NSUserDefaults returns immutable objects even if you set a default for a mutable object. These macros conveniently manage mutable objects...

```
defaultForMutableArray(yourMutableArray);
defaultForMutableData(yourMutableData);
defaultForMutableDictionary(yourMutableDictionary);
defaultForMutableString(yourMutableString);
defaultForStringArrayMutable(yourStringArrayMutable);
```

You can also test for the existence or non-existence of a default for an object...

```
BOOL exists = defaultExistsForObject(yourObject);
BOOL doesNotExist = defaultDoesNotExistForObject(yourObject);
```


---
## NSCoding

The macros support all the common NSKeyedArchiver and NSKeyedUnarchiver methods for convenient archiving and unarchiving. The parameter you pass can be a property, an instance variable, or a local variable. Once you archive you must use the same property, instance variable, or an identically named local variable for unarchiving.

```
// BOOL...
encodeBool(BOOL);
decodeBool(BOOL);

// double...
encodeDouble(double);
decodeDouble(double);

// float...
encodeFloat(float);
decodeFloat(float);

// int...
encodeInt(int);
decodeInt(int);

// int32...
encodeInt32(int32_t);
decodeInt32(int32_t);

// int64...
encodeInt64(int64_t);
decodeInt64(int64_t);

// objects...
encodeObject(object);
decodeObject(object);

// checking for a value...
containsValue(value);
```

**Important:** These macros assume that your coder and decoder use the standard names provided by Xcode's code completion: `aCoder` and `aDecoder` respectively. In other words, your method signatures for the NSCoding init and encode methods need to look like this:

```
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
```



---
## Tests

The Xcode project contains a complete suite of tests so you can use these macros with confidence. 


---
## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 


---
## Stringification

These macros are made possible by a feature of the C preprocessor called [Stringification](http://gcc.gnu.org/onlinedocs/cpp/Stringification.html). Basically, stringification returns a given symbol as a C string. 

> When a macro parameter is used with a leading ‘#’, the preprocessor replaces it with the literal text of the actual argument, converted to a string constant. 

For example, with this macro...

```
#define stringify(x) #x
```

this code

```
stringify(foo);
```

is replaced by the preprocessor with 'foo' as a C string. But it gets better. By prefixing with @ you get an NSString object instead of a C string. How handy is that? So, given these macros...

```
#define NS_STRINGIFY(x) @#x
define setDefaultForBOOL(bool) [[NSUserDefaults standardUserDefaults] setBool:bool forKey:NS_STRINGIFY(bool)]
```

this code...

```
setDefaultForBOOL(self.yourSwitch.on);
```

becomes this after the preprocessor has run...

```
[[NSUserDefaults standardUserDefaults] setBool:self.yourSwitch.on forKey:@"self.yourSwitch.on"];
```

You can see the result yourself by inspecting your preprocessor output in Xcode.

* use one of the macros in your code
* be sure it builds
* from the Product menu choose Perform Action then Preprocess "<yourFile>.m"

In the case of NSUserDefaults and NSCoding, these macros make things easier because, with stringification, the required key parameters become self-generating. 