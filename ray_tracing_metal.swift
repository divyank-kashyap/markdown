import MetalPerformanceShaders

let rayIntersector = MPSRayIntersector(device: device)
rayIntersector.rayDataType = .originMaskDirectionMaxDistance

let accelerationStructure = MPSTriangleAccelerationStructure(device: device)
// Fill in your geometry here
accelerationStructure.rebuild()

rayIntersector.encodeIntersection(
    commandBuffer: commandBuffer,
    intersectionType: .nearest,
    rayBuffer: rayBuffer,
    rayBufferOffset: 0,
    intersectionBuffer: intersectionBuffer,
    intersectionBufferOffset: 0,
    rayCount: rayCount,
    accelerationStructure: accelerationStructure
)