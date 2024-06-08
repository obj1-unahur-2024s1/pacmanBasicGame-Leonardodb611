import wollok.game.*

object cereza{
	const property image = "cherry.png"
	var property position = game.at(2.randomUpTo(4), 2.randomUpTo(4))
	
	
}

object pacman {
	const property image = "personaje.jpeg"
	var property position = game.origin()
	var vidas = 3
	
	
	
	method impactoCon(rival){
		
		
		
		position = game.origin()
		
		vidas = vidas - 1
		
		if(self.getVidas() == 0){
					game.stop()
		}
	}
	
	method getVidas(){
		return vidas
	}
	
	method resetPosition(){
		position = game.origin()
	}
}

class Rival {
	const numero
	
	
	var property position = game.at (pacman.position().x(),pacman.position().y())
	
	var previousPosition = position
	 
	
	method image() = "disparo.jpeg"
	
	method resetPosicion(){
		position = game.at(pacman.position().x(), pacman.position().y())
	}
	
	method acercarseA(personaje){
		
		
		var posicionPersonaje = personaje.position()
		
		
		var nuevaPosX =  position.x() + if(posicionPersonaje.x() > position.x()) 1 else -1
		var nuevaPosY = position.y() + if(posicionPersonaje.y() > position.y()) 1 else -1
		previousPosition = position
		nuevaPosX = nuevaPosX.max(0).min(game.width()-1)
		nuevaPosY = nuevaPosY.max(0).min(game.height()-1)
		
		position = game.at(nuevaPosX, nuevaPosY)
	}
	
	method irHaciaDerecha(){
		
		var positionx = position.x() + 1
		
		position = game.at(positionx, position.y())
		
	}
	
	method irHaciaIzquierda(){
		
		var positionx = position.x() - 1
		
		position = game.at(positionx, position.y())
		
	}
	
	method chocarCon(otro){
		self.resetpreviousPosicion()
	}
	
	method resetpreviousPosicion(){
		position = previousPosition
	}
	
	method impactoCon(rival){
		
		rival.setVidas(rival.getVidas()-1)	
		
		if(rival.getVidas()==0){
			game.removeVisual(rival)
			
		}	
			if(rival.getVidas().between(6,14)){
			game.removeVisual(rival)
			rival.image("cherry1.jpeg") 
			game.addVisual(rival)
			
		}
		
		if(rival.getVidas().between(1,5)){
			game.removeVisual(rival)
			rival.image("cherry2.jpeg") 
			game.addVisual(rival)
			
		}
		game.removeVisual(self)
	}
	
	
}

object imagen{
	var property position = game.at(0,0)
	var property image = "fondo.jpg"
}

class Enemigo{
	var numero 
	var property position = game.at(2.randomUpTo(14), 2.randomUpTo(10))
	var property image = "cherry.png"
	var  vidas = 3
	
	method getVidas(){
		return vidas
	}
	
	method setVidas(numero1){
		vidas = numero1
	}
	
	method impactoCon(rival){
		
		vidas = vidas -1
		
		if(self.getVidas()==0){
			game.removeVisual(self)
		}
		
		if(self.getVidas()==0){
			game.removeVisual(self)
			self.image("cherry1.jpeg") 
			game.addVisual(self)
		}
		if(self.getVidas()< 6){
			game.removeVisual(self)
			self.image("cherry2.jpeg") 
			game.addVisual(self)
		}
		
		
	}
}