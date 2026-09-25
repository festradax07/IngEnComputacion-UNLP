#include <Arduino_FreeRTOS.h>
#include <Arduino.h>

void TareaA(void *pvParameters)
{
    for (;;)
    {
        Serial.println("Tarea A");
    }
}

void TareaB(void *pvParameters)
{
    for (;;)
    {
        Serial.println("Tarea B");
    }
}

void TareaC(void *pvParameters)
{
    for (;;)
    {
        Serial.println("Tarea C");
    }
}

void setup()
{
    Serial.begin(9600);

    xTaskCreate(TareaA, "A", 128, NULL, 1, NULL);
    xTaskCreate(TareaB, "B", 128, NULL, 1, NULL);
    xTaskCreate(TareaC, "C", 128, NULL, 1, NULL);
}

void loop() {}