module entities;

import std.string;
import std.sumtype;
import asdf;
import mir.algebraic_alias.json;
import mir.algebraic;

import std.stdio;
import std.string;

//alias JvmArg = SumType!(JvmArgumentObj, string);
alias JsonValue = Variant!(JvmArgumentObj, string);

struct Arguments {
    @serdeKeys("jvm")
    JvmArgument[] jvm;
}

struct JvmArgument {
    Variant!(JvmArgumentObj, string) arg;
    alias arg this;

    SerdeException deserializeFromAsdf(Asdf data) {

        JsonValue jv;
        if(auto exc = deserializeValue(data, jv)) {
            return exc;
        }

        this = jv;
    
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