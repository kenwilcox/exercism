# Globals for the directions
# Change the values as you see fit
EAST = 0
NORTH = 1
WEST = 2
SOUTH = 3


class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.coordinates = (x_pos, y_pos)

    def move(self, directions):
        mapping_d = {'L': 1, 'R': -1}
        mapping_a = {EAST: (1, 0), NORTH: (0, 1), WEST: (-1, 0), SOUTH: (0, -1)}
        
        for d in directions:
            if d in 'LR':
                self.direction = (self.direction + mapping_d[d]) % 4
            elif d == 'A':
                x, y = self.coordinates
                dx, dy = mapping_a[self.direction]
                self.coordinates = (x + dx, y + dy)