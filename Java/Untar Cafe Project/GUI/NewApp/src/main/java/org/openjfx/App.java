package org.openjfx;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Orientation;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.stage.Stage;

import static javafx.scene.text.FontWeight.*;

/**
 * JavaFX App
 */
public class App extends Application {
    Scene Login, Register;
    Stage stage;

    @Override
    public void start(Stage stage) {

        VBox panel = new VBox();
        panel.setAlignment(Pos.CENTER);

        Button Login = new Button("Login");
        Login.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent actionEvent) {
                VBox vBox = new VBox();
                vBox.setPadding(new Insets(15, 15, 15, 12));
                vBox.setSpacing(8);
                vBox.setAlignment(Pos.CENTER);

                Separator separator1 = new Separator();
                separator1.setOrientation(Orientation.HORIZONTAL);

                Label login = new Label("Log In");
                login.setFont(Font.font("Tahoma", FontWeight.BOLD, 20));

                TextField nama = new TextField();
                nama.setText("Nama Lengkap");
                nama.setFocusTraversable(false);

                TextField norek = new TextField();
                norek.setText("Nomor Rekening");
                norek.setFocusTraversable(false);

                Button sign = new Button("Log In");
                sign.setOnAction(new EventHandler<ActionEvent>() {
                    @Override
                    public void handle(ActionEvent actionEvent) {

                        VBox vBox = new VBox();
                        vBox.setPadding(new Insets(15, 15, 15, 12));
                        vBox.setSpacing(8);
                        vBox.setAlignment(Pos.TOP_LEFT);

                        Label login = new Label("Payment");
                        login.setFont(Font.font("Tahoma", FontWeight.BOLD, 20));

                        Separator separator1 = new Separator();
                        separator1.setOrientation(Orientation.HORIZONTAL);

                        RadioButton P1 = new RadioButton("Token Listrik");
                        RadioButton P2 = new RadioButton("Pulsa");
                        RadioButton P3 = new RadioButton("Internet");
                        ToggleGroup tg = new ToggleGroup();
                        P1.setToggleGroup(tg);
                        P2.setToggleGroup(tg);
                        P3.setToggleGroup(tg);

                        TextField norek = new TextField();
                        norek.setText("Nomor Rekening");
                        norek.setFocusTraversable(false);

                        TextField saldo = new TextField();
                        saldo.setText("Jumlah");
                        saldo.setFocusTraversable(false);

                        Button ok = new Button();
                        ok.setText("OK");

                        ok.setOnAction(new EventHandler<ActionEvent>() {
                            @Override
                            public void handle(ActionEvent actionEvent) {
                                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                                alert.setTitle("Payment");
                                alert.setHeaderText("Hasil:");
                                alert.setContentText("Pembayaran Berhasil!");

                                alert.showAndWait();
                            }
                        });


                        vBox.getChildren().addAll(login,separator1,P1,P2,P3,norek,saldo,ok);

                        Scene secondScene = new Scene(vBox, 300, 300);

                        // New window (Stage)
                        Stage newWindow = new Stage();
                        newWindow.setTitle("Bank");
                        newWindow.setScene(secondScene);
                        newWindow.show();
                    }
                });

                vBox.getChildren().addAll(login,separator1,nama,norek,sign);
                Scene secondScene = new Scene(vBox, 300, 300);

                // New window (Stage)
                Stage newWindow = new Stage();
                newWindow.setTitle("Bank");
                newWindow.setScene(secondScene);
                newWindow.show();
            }
        });


        Button Register = new Button("Register");
        Register.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent actionEvent) {
                VBox vBox = new VBox();
                vBox.setPadding(new Insets(15, 15, 15, 12));
                vBox.setSpacing(8);
                vBox.setAlignment(Pos.CENTER);

                Separator separator1 = new Separator();
                separator1.setOrientation(Orientation.HORIZONTAL);

                Label login = new Label("Sign Up");
                login.setFont(Font.font("Tahoma", FontWeight.BOLD, 20));

                TextField nama = new TextField();
                nama.setText("Nama Lengkap");
                nama.setFocusTraversable(false);

                TextField norek = new TextField();
                norek.setText("Nomor Rekening");
                norek.setFocusTraversable(false);

                TextField noktp = new TextField();
                noktp.setText("Nomor KTP");
                noktp.setFocusTraversable(false);

                TextField alamat = new TextField();
                alamat.setText("Alamat Lengkap");
                alamat.setFocusTraversable(false);

                TextField saldo = new TextField();
                saldo.setText("Saldo Awal");
                saldo.setFocusTraversable(false);

                Button sign = new Button("Sign Up");
                sign.setOnAction(new EventHandler<ActionEvent>() {
                    @Override
                    public void handle(ActionEvent actionEvent) {

                        VBox vBox = new VBox();
                        vBox.setPadding(new Insets(15, 15, 15, 12));
                        vBox.setSpacing(8);
                        vBox.setAlignment(Pos.TOP_LEFT);

                        Label login = new Label("Payment");
                        login.setFont(Font.font("Tahoma", FontWeight.BOLD, 20));

                        Separator separator1 = new Separator();
                        separator1.setOrientation(Orientation.HORIZONTAL);

                        RadioButton P1 = new RadioButton("Token Listrik");
                        RadioButton P2 = new RadioButton("Pulsa");
                        RadioButton P3 = new RadioButton("Internet");
                        ToggleGroup tg = new ToggleGroup();
                        P1.setToggleGroup(tg);
                        P2.setToggleGroup(tg);
                        P3.setToggleGroup(tg);

                        TextField norek = new TextField();
                        norek.setText("Nomor Rekening");
                        norek.setFocusTraversable(false);

                        TextField saldo = new TextField();
                        saldo.setText("Jumlah");
                        saldo.setFocusTraversable(false);

                        Button ok = new Button();
                        ok.setText("OK");

                        ok.setOnAction(new EventHandler<ActionEvent>() {
                            @Override
                            public void handle(ActionEvent actionEvent) {
                                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                                alert.setTitle("Payment");
                                alert.setHeaderText("Hasil:");
                                alert.setContentText("Pembayaran Berhasil!");

                                alert.showAndWait();
                            }
                        });


                        vBox.getChildren().addAll(login,separator1,P1,P2,P3,norek,saldo,ok);

                        Scene secondScene = new Scene(vBox, 400, 400);

                        // New window (Stage)
                        Stage newWindow = new Stage();
                        newWindow.setTitle("Bank");
                        newWindow.setScene(secondScene);
                        newWindow.show();
                    }
                });

                vBox.getChildren().addAll(login,separator1,nama,norek,noktp,alamat,saldo,sign);
                Scene secondScene = new Scene(vBox, 300, 300);

                // New window (Stage)
                Stage newWindow = new Stage();
                newWindow.setTitle("Bank");
                newWindow.setScene(secondScene);
                newWindow.show();
            }
        });

        panel.getChildren().addAll(Login,Register);

        Scene Panel = new Scene(panel,200,200);
        stage.setScene(Panel);
        stage.setTitle("Bank");
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }


}