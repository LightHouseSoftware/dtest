import std.stdio;
import asdf;
import entities;

void main()
{
	string json = readFileAsString("files/1.16.5.json");
	Root data = json.deserialize!Root;

    JvmArgument[] jvmArgs = data.arguments.jvm;

    writeln(jvmArgs.length);
}

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
