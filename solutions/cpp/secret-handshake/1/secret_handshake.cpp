#include "secret_handshake.h"
#include<algorithm>

namespace secret_handshake {
    std::vector<std::string> commands(int num)
    {
        std::vector<std::string> res;
        if (num & 1) res.push_back("wink");
        if (num & 2) res.push_back("double blink");
        if (num & 4) res.push_back("close your eyes");
        if (num & 8) res.push_back("jump");
        if (num & 16) std::reverse(res.begin(), res.end());
        return res;
    }
}  // namespace secret_handshake
