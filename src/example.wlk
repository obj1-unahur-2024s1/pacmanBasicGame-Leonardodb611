import wollok.game.*

object pacman {
	const property image = "pacman.png"
	var property position = game.origin()
	var vidas = 3
	
	
	
	method chocarCon(rival){
		
		vidas = vidas - 1
		
		position = game.origin()
		rival.resetPosicion()
		vidas = vidas - 1
		
		if(self.getVidas() == 0){
					game.stop()
		}
	}
	
	method getVidas(){
		return vidas
	}
}

class Rival {
	const numero
	
	
	var property position = game.at (numero + 1, numero + 1)
	
	var previousPosition = position
	 
	
	method image() = "rival" + numero.toString() + ".png"
	
	method resetPosicion(){
		position = game.at (numero + 1, numero + 1)
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
	
	method chocarCon(otro){
		self.resetpreviousPosicion()
	}
	
	method resetpreviousPosicion(){
		position = previousPosition
	}
}
