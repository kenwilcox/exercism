// SpaceAge(1_000_000)
class SpaceAge {
    let seconds: Int
    
    init(_ seconds: Int) {
        self.seconds = seconds
    }
    
    var onEarth: Double {
        Double(seconds) / 31_557_600.0
    }
    
    var onMercury: Double {
        onEarth / 0.2408467
    }
    
    var onVenus: Double {
        onEarth / 0.61519726
    }
    
    var onMars: Double {
        onEarth / 1.8808158
    }
    
    var onJupiter: Double {
        onEarth / 11.862615
    }
    
    var onSaturn: Double {
        onEarth / 29.447498
    }
    
    var onUranus: Double {
        onEarth / 84.016846
    }
    
    var onNeptune: Double {
        onEarth / 164.79132
    }
    
    var onPluto: Double {
        onEarth / 247.92574
    }
    
    var onCeres: Double {
        onEarth / 4.60028905
    }
    
    var onEris: Double {
        onEarth / 556.9
    }
    
    var onMakemake: Double {
        onEarth / 309.59
    }
    
    var onHaumea: Double {
        onEarth / 285.01
    }
    
    var onSedna: Double {
        onEarth / 11_400.0
    }
}
