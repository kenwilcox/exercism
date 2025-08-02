import scala.collection.mutable.ArrayBuffer

class EmptyBufferException() extends Exception {}
class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {
  private val buffer = ArrayBuffer[Int]()
  def write(value: Int) = 
    if (buffer.size == capacity) throw new FullBufferException() 
    else buffer.append(value)

  def read(): Int = 
    if (buffer.size == 0) throw new EmptyBufferException() 
    else buffer.remove(0)

  def overwrite(value: Int) = 
    if (buffer.size == capacity) {
      read()
      write(value)
    } else {
      write(value)
    }

  def clear() = buffer.clear
}