# MSStringifyMacros

MSStringifyMacros provides a convenient alternative to the normally tedious and potentially error-prone standard approach to coding for NSUserDefaults and NSCoding.


## Benefits

Here's an example for NSUserDefaults. Normally, when coding for NSUserDefaults you would follow an approach like this where you would create constants for the keys and then set and get the defaults.

```Objective-C
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

```Objective-C
// setting defaults...
setDefaultForObject(self.foo);
setDefaultForObject(self.bar);

// getting defaults...
defaultForObject(self.foo);
defaultForObject(self.bar);
```

As you can see, there is a lot less code, it's a lot simpler, and less error-prone. If you're curious about how this works you can skip ahead to the Stringification section. The short story is that the keys required by the NSUserDefaults or NSCoding methods are created for you from the name of the property, instance variable, or local variable you pass.


## Installation

You can install MSStringifyMacros in almost any Mac OS X or iOS project. I'm not certain if there were ever any versions of Xcode where the preprocessor didn't support stringification to an NSString (see the Stringification section below). If you know, please let me know.


### Cocoapods

1. Add a pod entry for MSStringifyMacros to your Podfile: `pod 'MSStringifyMacros'`. If you want to add only specific macros you can use `pod 'MSStringifyMacros/UserDefaults'` or `pod 'MSStringifyMacros/Archiving'`. Refer to the podspec for the current submodules.
2. Install the pod(s) by running `pod install`.
3. Where you need it `#import "MSStringifyMacros_Archiving.h"` or `#import "MSStringifyMacros_UserDefaults.h"`.

### Source Files

Alternatively you can directly add the required `MSStringifyMacros*.h` source files to your project.



## Usage

Macros are provided for conveniently working with NSUserDefaults and NSKeyedArchiver and NSKeyedUnarchiver.

**Important**: The parameter you pass can be a property, an instance variable, or a local variable. It is critical to remember that the name of the parameter you pass is used to generate the string used for the key (see the Stringification section). So once you set a default or encode you must use either the same or an identically named property, instance variable, or local variable for getting the default or decoding.

### NSUserDefaults

The macros support all the common NSUserDefaults methods for conveniently setting and getting defaults.

```Objective-C
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
setDefaultForInteger(integer);
defaultForInteger(integer);

// object...
setDefaultForObject(object);
defaultForObject(object);
removeDefaultForObject(object);

// array...
defaultForArray(array);

// data...
defaultForData(data);

// dictionary...
defaultForDictionary(dictionary);

// string...
defaultForString(string);

// array of strings...
defaultForStringArray(srrayOfStrings);

// url...
defaultForURL(url);
```


### NSUserDefaults Extras

By default, NSUserDefaults returns immutable objects even if you set a default for a mutable object. These macros conveniently manage mutable objects...

```Objective-C
defaultForMutableArray(mutableArray);
defaultForMutableData(mutableData);
defaultForMutableDictionary(mutableDictionary);
defaultForMutableString(mutableString);
defaultForStringArrayMutable(stringArrayMutable);
```

You can also test for the existence or non-existence of a default for an object...

```Objective-C
BOOL exists = defaultExistsForObject(object);
BOOL doesNotExist = defaultDoesNotExistForObject(object);
```


### NSCoding

The macros support all the common NSKeyedArchiver and NSKeyedUnarchiver methods for convenient archiving and unarchiving.

```Objective-C
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

```Objective-C
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
```



## Tests

The Xcode project contains a complete suite of tests so you can use these macros with confidence. 


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 


## Stringification

These macros are made possible by a feature of the C preprocessor called [Stringification](http://gcc.gnu.org/onlinedocs/cpp/Stringification.html). Basically, stringification returns a given symbol as a C string. 

> When a macro parameter is used with a leading ‘#’, the preprocessor replaces it with the literal text of the actual argument, converted to a string constant. 

For example, with this macro...

```Objective-C
#define stringify(x) #x
```

this code

```Objective-C
stringify(foo);
```

is replaced by the preprocessor with 'foo' as a C string. But it gets better. By prefixing with @ you get an NSString object instead of a C string. How handy is that? So, given these macros...

```Objective-C
#define NS_STRINGIFY(x) @#x
define setDefaultForBool(BOOL) [[NSUserDefaults standardUserDefaults] setBool:BOOL forKey:NS_STRINGIFY(BOOL)]
```

this code...

```Objective-C
setDefaultForBool(self.yourSwitch.on);
```

becomes this after the preprocessor has run...

```Objective-C
[[NSUserDefaults standardUserDefaults] setBool:self.yourSwitch.on forKey:@"self.yourSwitch.on"];
```

You can see the result yourself by inspecting your preprocessor output in Xcode.

* use one of the macros in your code
* be sure it builds
* from the Product menu choose Perform Action then Preprocess "\<yourFile\>.m"

In the case of NSUserDefaults and NSCoding, these macros make things easier because, with stringification, the required key parameters become self-generating.