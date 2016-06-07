# Constants
h = 6.63e-34
c = 3e8

# Problem 5.47

def getWatts(j,s)
  return j/s
end

puts getWatts(2500*4184,24*60*60)

# Problem 5.51

def calcWavelength(e,h,c)
  return (h*c)/e
end

def calcFreq(e,h)
  return e/h
end

puts calcWavelength(1.1e4*1.6e-19,h,c)
puts calcFreq(1.1e4*1.6e-19,h)
