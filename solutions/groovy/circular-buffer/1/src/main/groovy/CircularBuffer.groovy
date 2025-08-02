class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    private int cap = 0
    private List<int> buffer = []

    CircularBuffer(int capacity) {
        cap = capacity
        clear()
    }

    def clear() {
        buffer = []
    }

    def read() {
        if (buffer.size() == 0) throw new EmptyBufferException()
        return buffer.remove(0)
    }

    def write(int item) {
        if (buffer.size == cap) throw new FullBufferException()
        buffer.add(item)
    }

    def overwrite(int item) {
        if (buffer.size() == cap) buffer.remove(0)
        buffer.add(item)
    }
}
