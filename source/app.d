import std.stdio;
import std.algorithm;
import asdf;
import mir.algebraic_alias.json;
import mir.algebraic;
import entities;

void main()
{
    string json = readFileAsString("files/1.16.5.json");
    Root data = json.deserialize!Root;

   auto jvmArgs = data.arguments.jvm;

    // jvmArgs
    //     .filter!(a => isString(a))
    //     .each!(a => a.writeln);
}

// bool isString(JvmArgument arg)
// {
//     return arg.match!(
//         (string s) => true,
//         _ => false
//     );
// }

// bool isJvmArgumentObj(JvmArgument arg)
// {
//     return arg.match!(
//         (JvmArgumentObj obj) => true,
//         _ => false
//     );
// }

string readFileAsString(string path)
{
    string line;

	import std.file;
    import std.exception;

    try {
        auto file = File(path, "r");
        line = readText(path);
    }
    catch (ErrnoException ex) {
        ex.writeln;
    }

    return line;
}
