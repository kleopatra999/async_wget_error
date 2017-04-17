#include <emscripten.h>

void emscripten_main();
void file_callback(const char * file);
void error_callback(const char * file);

int main()
{
	const char * full_path = "http://localhost:4375/file.txt";
	const char * file_name = "file.txt";
	emscripten_async_wget(full_path, file_name, file_callback, error_callback);
	emscripten_set_main_loop(emscripten_main, 0, 0);
	
	return 0;
}
void emscripten_main()
{
}
void file_callback(const char * file)
{
	printf("file received:%s\n", file);
}

void error_callback(const char * file)
{
	printf("file error:%s\n", file);
}
