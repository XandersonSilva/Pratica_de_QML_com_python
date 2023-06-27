from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import sys

class contador :
    valAtual = 0
contClick = contador()

class ponte(QObject):
    @Slot(str, str, str, str, result=str)
    def Mudar_posicao(self, posX, posY, iniX, iniY):
            posX, posY, iniX, iniY = float(posX), float(posY), float(iniX), float(iniY)
            contClick.valAtual += 1
            cont = contClick.valAtual
            if posX == iniX and posY == iniY:
                if cont > 1:
                    text = 'Você trocou o tema ' + str(cont) + ' vezes!'
                else:
                    text = 'Você trocou o tema ' + str(cont) + ' vez!'
            else:
                if cont > 1:
                    text = 'Você trocou o tema ' + str(cont) + ' vezes!'
                else:
                    text = 'Você trocou o tema ' + str(cont) + ' vez!'
            return text

app = QGuiApplication([])

engine = QQmlApplicationEngine()
engine.load('main.qml')

ponte = ponte()
context = engine.rootContext()
context.setContextProperty('ponte', ponte)




if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
