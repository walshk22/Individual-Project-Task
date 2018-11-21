//GATHERING DATA FROM GITHUB API AND POSTING INFO ON GITHUB


/*#include <iostream>

#include "restc-cpp/restc-cpp.h"
#include "restc-cpp.h"
#include "restc-cpp/logging.h"

#include <boost/log/core.hpp>
#include <boost/log/trivial.hpp>
#include <boost/log/expressions.hpp>

using namespace std;

int main()
{
    // Set up logging
    namespace logging = boost::log;
    logging::core::get()->set_filter (
                                      logging::trivial::severity >= logging::trivial::debug
                                      );
    
    // Create a rest client.
    auto rest_client = RestClient::Create();
    
    // Do the work in a lambda
    auto done = rest_client->ProcessWithPromise([&](Context& ctx) {
        // Here we are executing the coroutine in a worker thread.
        // The worker thread belongs to the RestClient instance.
        // We can run a large number of concurrent, independent
        // coroutines with this thread.
        
        // Fetch some data
        auto repl = ctx.Get(https:api.github.com);
        
        // Do something
        ...
        
        // Exit the coroutine
    });
    
    try {
        // The calling thread waits here for the coroutine to finish.
        // (The worker thread is still available, as the RestClient
        // instance (rest_client) is still in scope.)
        done.get();
    } catch(const exception& ex) {
        clog << "Main thread: Caught exception from coroutine: "
        << ex.what() << endl;
    }
    
    
    SomeDataClass data_object;
    data_object.userid   = "catch22";
    data_object.motto    = "Carpe Diem!";

    auto reply = RequestBuilder(ctx)
    .Post(https:github.com/walshk22/Individual-Project-Task.git)              // URL
    .Header("X-Client", "RESTC_CPP")                   // Optional header
    .Data(data_object)                                 // Data object to send
.   Execute();
    
}*/

#include <iostream>
#include "restc-cpp/restc-cpp.h"

using namespace std;
using namespace restc_cpp;

void DoSomethingInteresting(Context& ctx) {
    // Here we are in a co-routine, running in a worker-thread.
    
    // Asynchronously connect to a server and fetch some data.
    //FOR TESTING
    auto reply = ctx.Get("http://jsonplaceholder.typicode.com/posts/1");
    
    //auto reply = ctx.Get("https://api.github.com/user");
    // Asynchronously fetch the entire data-set and return it as a string.
    auto json = reply->GetBodyAsString();
    
    // Just dump the data.
    cout << "Received data: " << json << endl;
}

int main() {
    auto rest_client = RestClient::Create();
    
    // Call DoSomethingInteresting as a co-routine in a worker-thread.
    rest_client->Process(DoSomethingInteresting);
    
    // Wait for the coroutine to finish, then close the client.
    rest_client->CloseWhenReady(true);
}
