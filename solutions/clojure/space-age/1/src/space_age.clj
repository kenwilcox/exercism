(ns space-age)

(defn on-earth [s] 
  (/ s 31557600))

(defn on-mercury [s] 
  (/ (on-earth s) 0.2408467))

(defn on-venus [s] 
  (/ (on-earth s) 0.61519726))

(defn on-mars [s] 
  (/ (on-earth s) 1.8808158))

(defn on-jupiter [s]
  (/ (on-earth s) 11.862615))

(defn on-saturn [s]
  (/ (on-earth s) 29.447498))

(defn on-uranus [s]
  (/ (on-earth s) 84.016846))

(defn on-neptune [s]
  (/ (on-earth s) 164.79132))
