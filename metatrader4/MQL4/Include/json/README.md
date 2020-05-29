# JAson.mqh
JSON serialization and deserialization (native MQL) for MetaTrader 4/5.

## Description
This code is ported from a high-speed С++ library.  It was [originally posted](https://www.mql5.com/en/code/13663) on the MetaTrader code forums.

## Examples
```mql4
string in, out;
CJAVal js(NULL, jtUNDEF); bool b;

//---
Print("JASon Example Deserialization:");

in="{\"a\":[1,2]}"; out=""; // example of input data
b=js.Deserialize(in); // deserialized
js.Serialize(out); // serialized again
Print(in+" -> "+out); // output for comparison

//---
Print("JASon Example Serialization:");

js["Test"]=1.4; // input data example
out=""; js.Serialize(out); // serialized
Print(out); // output
```

Authorization on a website and parsing the response:
```mql4
CJAVal jv;
jv["login"]="Login"; // login
jv["password"]="Pass"; // password

//--- serialize to string  {"login":"Login","password":"Pass"}
char data[]; 
ArrayResize(data, StringToCharArray(jv.Serialize(), data, 0, WHOLE_ARRAY)-1);

//--- send data
char res_data[];
string res_headers=NULL;
int r=WebRequest("POST", "http://my.site.com/Authorize", "Content-Type: text/plain\r\n", 5000, data, res_data, res_headers);

//--- assume the answer {"accessToken":"ABRAKADABRA","session_id":124521}
//--- get AccessToken
jv.Deserialize(res_data);
string AccessToken=jv["accessToken"].ToStr();
```

## Author
[sergeev](https://www.mql5.com/en/users/sergeev)
