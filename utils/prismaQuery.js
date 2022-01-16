import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function getLeagues(thistable){

    const data = await prisma.league.findMany({})

    return data

}

