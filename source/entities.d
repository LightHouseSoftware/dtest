module entities;

import std.string;
import std.sumtype;
import asdf;

import std.stdio;

alias JvmArgument = SumType!(JvmArgumentObj, string);

struct Arguments {
    @serdeKeys("jvm")
    JvmArgument[] jvm;

    SerdeException deserializeFromAsdf(Asdf data) {

        JvmArgument arg;
        if (auto exc = deserializeValue(data, arg)) {
            return exc;
        }
        
        jvm ~= arg;
    
        return null;
    }
}

struct JvmArgumentObj {
    @serdeKeys("rules")
    Rule[] rule;
    @serdeKeys("value")
    string[] value;
}

struct Os{
    @serdeKeys("name")
    @serdeOptional
    string name;
}

struct Rule{
    @serdeKeys("action") 
    string action;
    @serdeKeys("os")
    @serdeOptional
    Os os;
}

struct Root{
    @serdeKeys("arguments") 
    Arguments arguments;
}