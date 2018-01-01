#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "cryptonight/cryptonight.h"

void print_hex(uint8_t* buffer, int len){
    int i;
    for (i = 0; i<len; i++){
        printf("%02X", buffer[i]);
    }
}

struct cryptonight_ctx* cn_create_context() {
//    printf("cn_create_context\n");
    struct cryptonight_ctx *ctx = (struct cryptonight_ctx*)malloc(sizeof(struct cryptonight_ctx));
    return ctx;
}
void cn_hash(struct cryptonight_ctx *ctx, const void *input, void *output){
    // printf("Input: ");
    // print_hex((uint8_t*)input, 84);
    // printf("\n");

    cryptonight_hash_ctx((uint8_t*)output, input, ctx);

    // printf("Output: ");
    // print_hex(output, 32);
    // printf("\n");
}
void cn_destroy_context(struct cryptonight_ctx *ctx){
    free(ctx);
}
