extends Node2D

@export var speed : float = 400


func _ready() -> void:
    #Ekrandan çıktığında ateşlenen bu sinyali 'queue_free' fonksiyonuna, yani mermimizin yok olmasını sağlayacak fonksiyona bağlıyoruz.
    $VisibleOnScreenNotifier2D.screen_exited.connect(queue_free)
    $HitBox.hit_something.connect(queue_free)

## Process fonksiyonu kullanan birden fazla script çalıştırmak iyi bir alışkanlık değil! Aklınızda bulunsun. Ancak başlangıçta çok takmanıza gerek yok ^^
func _process(delta: float) -> void:
    self.position.x += speed * delta
    $BulletSprite.rotate(0.2 * delta)
