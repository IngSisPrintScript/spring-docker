package org.austral.ingsis

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class ComposeApplication

fun main(args: Array<String>) {
	runApplication<ComposeApplication>(*args)
}
