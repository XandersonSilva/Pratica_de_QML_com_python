import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Universal 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    
    id: fundo_janela
    visible: true //Esse elemento é crusial para a exibição da tela via PySide
    title: "Rascunho de interface"
    Universal.theme: Universal.Dark
    minimumHeight: 300
    minimumWidth: 600

    maximumHeight:600
    maximumWidth:1200

    color: "White"

    
    /*  Teste de utilização de botão
     *
     *  Button{
     *      highlighted: true //Usado para permitir a mudança na cor do accent(equivalente ao backgound no css)
     *      Universal.accent: Universal.Cyan //Comando para mudar a cor do accent
     *      text: "Teste de uso de Label"
     *      height: 25
     *      width: 250
     *      x: 610
     *  }
     */

    
    //anchors.centerIn: parent


    Rectangle{
        id: tela_modo
        width:  parent.width/2
        height: parent.height/2
        color: fundo_janela.color

        Text{
            anchors.centerIn: parent
            x: parent.width/2
            id: texto_modo
            text:"Modo claro"
            font.pixelSize: 24
        }

        Rectangle{
            id: informacao
            height: 25
            width: 300
            x: parent.width
            y: 0

            Text{
                id: informacao_T
                anchors.centerIn: parent
                text:""
            }
        }

        Rectangle{
            id: btn_fundo
            x: 0
            y: parent.height - 2.5
            width: parent.width/4 + 77.5
            height: 80
            color: "#3B82E3"
            radius: 40
        }

        Rectangle{
            id: obj_animad
            x: parent.width/4
            y: parent.height 
            width: 75
            height: 75
            color: "yellow"
            radius: 100


            Behavior on x {
                NumberAnimation{
                    duration: 300
                    easing.type: Easing.OutBack
                }
            }
            Behavior on y {
                NumberAnimation{
                    duration: 300
                    easing.type: Easing.OutBack
                }
            }



            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (parent.x == tela_modo.width/4 && parent.y == tela_modo.height){
                        parent.x = 2.5
                        
                        texto_modo.text = "Modo escuro"
                        fundo_janela.color = "black"
                        texto_modo.color = "white"
                        informacao.color = "black"
                        informacao_T.color = "white"

                        btn_fundo.color = "#0B192B"
                        obj_animad.color = "white"
                    }else{
                        parent.x = tela_modo.width/4
                        parent.y = tela_modo.height

                        texto_modo.text = "Modo claro"
                        fundo_janela.color = "white"
                        texto_modo.color = "black"
                        informacao.color = "white"
                        informacao_T.color = "black"

                        btn_fundo.color = "#3B82E3"
                        obj_animad.color = "yellow"
                    }

                    var resposta = ponte.Mudar_posicao(parent.x, parent.y, tela_modo.width, tela_modo.height);
                    informacao_T.text = resposta

                }
            }
        }
    }
}



